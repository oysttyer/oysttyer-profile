# An extension for oysttyer (https://github.com/oysttyer/oysttyer) that adds commands to update user_profile information
# I had NO IDEA what I was doing in Perl when I wrote this
# Mostly cobbled together from the examples on the Floodgap page and extensions by others.

$addaction = sub {
	my $command = shift;

	if ($command =~ s#^/profile-desc ## && length($command)){
		if (length($command) <= 160){
			&updateprofile("description", $command);
		} else {
			print "Profile description is limited to 160 characters";
		}
		return 1;
	} elsif ($command =~ s#^/profile-name ## && length($command)){
		if (length($command) <= 20){
			&updateprofile("name", $command);
		} else {
			print "Profile name is limited to 20 characters";
		}
		return 1;
	} elsif ($command =~ s#^/profile-loc ## && length($command)){
		if (length($command) <= 30){
			&updateprofile("location", $command);
		} else {
			print "Profile location is limited to 30 characters";
		}
		return 1;
	} elsif ($command =~ s#^/profile-url ## && length($command)){
		&updateprofile("url", $command);
		return 1;
	}
	#Should look into a neater way to do that: http://www.misc-perl-info.com/perl-switch.html
	
	#Just a little test extension/handy alias.
	if ($command =~ m#^/whoami#) {
		&ucommand("/whois ${whoami}");
		return 1;
	}
	return 0;
};

sub updateprofile{
	my $parameter = $_[0];
	my $update = $_[1];
	
	$profileurl ||= "${apibase}/account/update_profile.json";
	$result = &postjson("$profileurl","${parameter}=".&url_oauth_sub($update));
	if (defined($result) && ref($result) eq 'HASH') {
		print "Profile updated \n";
		return 1;
	}
}
