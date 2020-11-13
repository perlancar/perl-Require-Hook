package Require::Hook;

# AUTHORITY
# DATE
# DIST
# VERSION

1;
# ABSTRACT: Namespace for require() hooks

=head1 DESCRIPTION

As one already understands, Perl lets you put coderefs or objects in C<@INC> as
"hooks". This lets you do all sorts of things when it comes to loading modules,
for example:

=over

=item * faking that a module does not exist when it does

This can be used for testing.

=item * loading module from various sources

You can load module source from the DATA section or variables, as is done in a
fatpacked script. Or you can retrieve module source from CPAN so a script can
magically run without installing extra CPAN modules.

=item * munging source code

Like adding some Perl code before (C<use strict;>) or after, for testing purpose
or otherwise.

=item * decrypt from an ecrypted source

=back

In the case of objects, perl will call your C<INC> method. So this is how you
would write a module for a require hook:

 package My::INCHandler;
 sub new { ... }
 sub My::INCHandler::INC {
     my ($self, $filename) = @_;
     ...
 }
 1;

C<Require::Hook> is just a namespace to put and share all your require hooks.


=head1 SEE ALSO

C<Require::Hook::*> modules.

L<Require::HookChain> is another namespace for require hooks and also a way to
use C<Require::Hook::*> modules.

L<RHC> is a short alias for Require::HookChain for convenience in one-liners.
