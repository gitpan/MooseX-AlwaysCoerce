package MooseX::AlwaysCoerce;
{
  $MooseX::AlwaysCoerce::VERSION = '0.21';
}
# git description: v0.20-7-gd590377

BEGIN {
  $MooseX::AlwaysCoerce::AUTHORITY = 'cpan:RKITOVER';
}
# ABSTRACT: Automatically enable coercions for Moose attributes

use strict;
use warnings;

use namespace::autoclean 0.12;
use Moose ();
use MooseX::ClassAttribute 0.24 ();
use Moose::Exporter;
use Moose::Util::MetaRole;
use Carp;

Moose::Exporter->setup_import_methods;


{
    package MooseX::AlwaysCoerce::Role::Meta::Attribute;
{
  $MooseX::AlwaysCoerce::Role::Meta::Attribute::VERSION = '0.21';
}
# git description: v0.20-7-gd590377

BEGIN {
  $MooseX::AlwaysCoerce::Role::Meta::Attribute::AUTHORITY = 'cpan:RKITOVER';
}
    use namespace::autoclean;
    use Moose::Role;

    around should_coerce => sub {
        my $orig = shift;
        my $self = shift;

        my $current_val = $self->$orig(@_);

        return $current_val if defined $current_val;

        return 1 if $self->type_constraint && $self->type_constraint->has_coercion;
        return 0;
    };

    package MooseX::AlwaysCoerce::Role::Meta::Class;
{
  $MooseX::AlwaysCoerce::Role::Meta::Class::VERSION = '0.21';
}
# git description: v0.20-7-gd590377

BEGIN {
  $MooseX::AlwaysCoerce::Role::Meta::Class::AUTHORITY = 'cpan:RKITOVER';
}
    use namespace::autoclean;
    use Moose::Role;
    use Moose::Util::TypeConstraints;

    around add_class_attribute => sub {
        my $next = shift;
        my $self = shift;
        my ($what, %opts) = @_;

        if (exists $opts{isa}) {
            my $type = Moose::Util::TypeConstraints::find_or_parse_type_constraint($opts{isa});
            $opts{coerce} = 1 if not exists $opts{coerce} and $type->has_coercion;
        }

        $self->$next($what, %opts);
    };
}

my (undef, undef, $init_meta) = Moose::Exporter->build_import_methods(

    install => [ qw(import unimport) ],

    class_metaroles => {
        attribute   => ['MooseX::AlwaysCoerce::Role::Meta::Attribute'],
        class       => ['MooseX::AlwaysCoerce::Role::Meta::Class'],
    },

    role_metaroles => {
        (Moose->VERSION >= 1.9900
            ? (applied_attribute => ['MooseX::AlwaysCoerce::Role::Meta::Attribute'])
            : ()),
        role                => ['MooseX::AlwaysCoerce::Role::Meta::Class'],
    }
);

sub init_meta {
    my ($class, %options) = @_;
    my $for_class = $options{for_class};

    MooseX::ClassAttribute->import({ into => $for_class });

    # call generated method to do the rest of the work.
    goto $init_meta;
}

1;
# vim:et sts=4 sw=4 tw=0:

__END__

=pod

=encoding UTF-8

=for :stopwords Rafael Kitover <rkitover@cpan.org> Jesse Luehrs Karen Etheridge Michael G.
Schwern coercions AnnoCPAN Rolsky

=head1 NAME

MooseX::AlwaysCoerce - Automatically enable coercions for Moose attributes

=head1 VERSION

version 0.21

=head1 SYNOPSIS

    package MyClass;

    use Moose;
    use MooseX::AlwaysCoerce;
    use MyTypeLib 'SomeType';

    has foo => (is => 'rw', isa => SomeType); # coerce => 1 automatically added

    # same, MooseX::ClassAttribute is automatically applied
    class_has bar => (is => 'rw', isa => SomeType);

=head1 DESCRIPTION

Have you ever spent an hour or more trying to figure out "Hey, why did my
coercion not run?" only to find out that you forgot C<< coerce => 1 >> ?

Just load this module in your L<Moose> class and C<< coerce => 1 >> will be
enabled for every attribute and class attribute automatically.

Use C<< coerce => 0 >> to disable a coercion explicitly.

=for Pod::Coverage init_meta

=head1 BUGS

Please report any bugs or feature requests to C<bug-moosex-alwayscoerce at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-AlwaysCoerce>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find more information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-AlwaysCoerce>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/MooseX-AlwaysCoerce>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/MooseX-AlwaysCoerce>

=item * Search CPAN

L<http://search.cpan.org/dist/MooseX-AlwaysCoerce/>

=back

=head1 ACKNOWLEDGEMENTS

My own stupidity, for inspiring me to write this module.

Dave Rolsky, for telling me how to do it the L<Moose> way.

=head1 AUTHOR

Rafael Kitover <rkitover@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Rafael Kitover <rkitover@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 CONTRIBUTORS

=over 4

=item *

Jesse Luehrs <doy@tozt.net>

=item *

Karen Etheridge <ether@cpan.org>

=item *

Michael G. Schwern <schwern@pobox.com>

=back

=cut
