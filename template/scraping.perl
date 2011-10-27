use strict;
use warnings;
use utf8;
use Web::Scraper;
use URI;

my $scraper = scraper {
	process '{{_cursor_}}', 'data' => 'TEXT';
	result 'data';
};
$scraper->user_agent->env_proxy;

use YAML::Syck;
for (@{$scraper->scrape( URI->new('') )}) {
	print $_->{data}, "\n";
}
