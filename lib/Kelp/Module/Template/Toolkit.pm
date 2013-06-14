package Kelp::Module::Template::Toolkit;
use Kelp::Base 'Kelp::Module::Template';
use Template;

our $VERSION = 0.01;

attr ext => 'tt';

sub build_engine {
    my ( $self, %args ) = @_;
    return Template->new( \%args );
}

sub render {
    my ( $self, $template, $vars, @rest ) = @_;
    my $output;
    $self->engine->process( $template, $vars, \$output, @rest );
    return $output;
}

1;

__END__

=pod

=head1 NAME

Kelp::Module::Template::Toolkit - Template::Toolkit processing for Kelp applications

=head1 SYNOPSIS

First ...

    # conf/config.pl
    {
        modules => ['Template::Toolkit'],
        modules_init => {
            'Template::Toolkit' => { ... }
        }
    };

Then ...

    # lib/MyApp.pm
    sub some_route {
        my $self = shift;
        $self->template('some_template', { bar => 'foo' });
    }

=head1 DESCRIPTION

This module provides an interface for using L<Template> inside a Kelp web application.

=head1 REGISTERED METHODS

=head2 template

C<template($filename, \%vars)>

Renders a file using the currently loaded template engine.

=head1 PERKS

=head2 UTF8

L<Template> is sometimes unable to detect the correct encoding, so to ensure
proper rendering, you may want to add C<ENCODING> to its configuration:

    # conf/config.pl
    {
        modules      => ['Template::Toolkit'],
        modules_init => {
            'Template::Toolkit' => {
                ENCODING => 'utf8'
            }
        }
    };


=cut
