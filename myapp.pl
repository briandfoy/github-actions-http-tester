#!/usr/bin/env perl
use Mojolicious::Lite -signatures;

get '/' => sub ($c) {
  $c->render(text => $c->req->to_string);
};

app->start;
