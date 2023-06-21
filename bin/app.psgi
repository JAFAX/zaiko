#!/usr/bin/env perl

package main {
    use strictures;
    use English;
    use utf8;

    use FindBin;
    use lib "$FindBin::Bin/../lib";

    use Zaiko;
    use ZaikoApi;

    use Plack::Builder;

    builder {
        mount '/'       => Zaiko->to_app;
        mount '/api/v1' => ZaikoApi->to_app;
    }
}
