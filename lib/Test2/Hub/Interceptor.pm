package Test2::Hub::Interceptor;
use strict;
use warnings;

use Test2::Hub::Interceptor::Terminator();

use base 'Test2::Hub';
use Test2::Util::HashBase;

sub inherit {
    my $self = shift;
    my ($from, %params) = @_;

    if ($from->{+IPC} && !$self->{+IPC} && !exists($params{ipc})) {
        my $ipc = $from->{+IPC};
        $self->{+IPC} = $ipc;
        $ipc->add_hub($self->{+HID});
    }
}

sub terminate {
    my $self = shift;
    my ($code) = @_;
    die bless(\$code, 'Test2::Hub::Interceptor::Terminator');
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Test2::Hub::Interceptor - Hub used by interceptor to grab results.

=head1 EXPERIMENTAL RELEASE

This is an experimental release. Using this right now is not recommended.

=head1 SOURCE

The source code repository for Test2 can be found at
F<http://github.com/Test-More/Test2/>.

=head1 MAINTAINERS

=over 4

=item Chad Granum E<lt>exodist@cpan.orgE<gt>

=back

=head1 AUTHORS

=over 4

=item Chad Granum E<lt>exodist@cpan.orgE<gt>

=back

=head1 COPYRIGHT

Copyright 2015 Chad Granum E<lt>exodist7@gmail.comE<gt>.

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

See F<http://dev.perl.org/licenses/>

=cut