# NAME

MooseX::AlwaysCoerce - Automatically enable coercions for Moose attributes

# VERSION

version 0.21

# SYNOPSIS

    package MyClass;

    use Moose;
    use MooseX::AlwaysCoerce;
    use MyTypeLib 'SomeType';

    has foo => (is => 'rw', isa => SomeType); # coerce => 1 automatically added

    # same, MooseX::ClassAttribute is automatically applied
    class_has bar => (is => 'rw', isa => SomeType);

# DESCRIPTION

Have you ever spent an hour or more trying to figure out "Hey, why did my
coercion not run?" only to find out that you forgot `coerce => 1` ?

Just load this module in your [Moose](https://metacpan.org/pod/Moose) class and `coerce => 1` will be
enabled for every attribute and class attribute automatically.

Use `coerce => 0` to disable a coercion explicitly.

# BUGS

Please report any bugs or feature requests to `bug-moosex-alwayscoerce at rt.cpan.org`, or through
the web interface at [http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-AlwaysCoerce](http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MooseX-AlwaysCoerce).  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

# SUPPORT

You can find more information at:

- RT: CPAN's request tracker

    [http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-AlwaysCoerce](http://rt.cpan.org/NoAuth/Bugs.html?Dist=MooseX-AlwaysCoerce)

- AnnoCPAN: Annotated CPAN documentation

    [http://annocpan.org/dist/MooseX-AlwaysCoerce](http://annocpan.org/dist/MooseX-AlwaysCoerce)

- CPAN Ratings

    [http://cpanratings.perl.org/d/MooseX-AlwaysCoerce](http://cpanratings.perl.org/d/MooseX-AlwaysCoerce)

- Search CPAN

    [http://search.cpan.org/dist/MooseX-AlwaysCoerce/](http://search.cpan.org/dist/MooseX-AlwaysCoerce/)

# ACKNOWLEDGEMENTS

My own stupidity, for inspiring me to write this module.

Dave Rolsky, for telling me how to do it the [Moose](https://metacpan.org/pod/Moose) way.

# AUTHOR

Rafael Kitover <rkitover@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2009 by Rafael Kitover <rkitover@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

# CONTRIBUTORS

- Jesse Luehrs <doy@tozt.net>
- Karen Etheridge <ether@cpan.org>
- Michael G. Schwern <schwern@pobox.com>
