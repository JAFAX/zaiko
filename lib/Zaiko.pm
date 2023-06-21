package Zaiko {
    use strictures;
    use English;
    use utf8;

    use feature ":5.36";
    use Syntax::Keyword::Try qw( try :experimental );

    use Dancer2;

    use FindBin;
    use lib "$FindBin::Bin/../lib";

    use Zaiko::Exceptions;
    use parent qw(Zaiko::Exceptions);

    our $VERSION = '0.1';

    get '/' => sub {
        template 'index' => { 'title' => 'Zaiko' };
    };

    true;
}
