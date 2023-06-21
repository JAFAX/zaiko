package ZaikoApi {
    use strictures;
    use English;
    use utf8;

    use feature ":5.36";
    use Syntax::Keyword::Try qw(try :experimental);

    use Dancer2;

    use FindBin;
    use lib "$FindBin::Bin/../lib";

    use Zaiko::API::Exceptions;
    use parent qw(Zaiko::API::Exceptions);

    our $VERSION = '0.1';

    get '/' => sub {
        template 'index' => { 'title' => 'zaiko' };
    };

    true;
}
