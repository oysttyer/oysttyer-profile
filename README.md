#User Profile Extension for oysttyer

A very simple extension for [oysttyer](https://github.com/oysttyer/oysttyer) that adds commands allowing you to update your user profile.

##Installation

Reference in your `.oysttyerrc` file like so:

	exts=/path/to/profile.pl

##Commands

It makes the following commands available:

- `/profile-desc` - Update your profile description
- `/profile-loc` - Update your location 
- `/profile-name` - Update your display name (not your username)
- `/profile-url` - Update your profile URL
- `/whoami` - Just a shortcut/alias for `/whois <your username>`

So, for example, you'd use it like follows:

	oysttyer> /whoami <007  

	atomicules (atomicules) (f:92/76) (u:3409) 
	"Here is my old, out-of-date and boring profile description"
	URL:            http://atomicules.co.uk
	Location:       Way Up North, Scotland
	Picture:        http://a0.twimg.com/profile_images/1728062610/atomicules_normal.png

	oysttyer> /profile-desc Here is my new, exciting profile description<103  
	Profile updated 
	>>> @atomicules user_updated @atomicules (basic)  

	oysttyer> /whoami <007  

	atomicules (atomicules) (f:92/76) (u:3409) 
	"Here is my new, exciting profile description"
	URL:            http://atomicules.co.uk
	Location:       Way Up North, Scotland
	Picture:        http://a0.twimg.com/profile_images/1728062610/atomicules_normal.png

##Warnings

I didn;t know what the hell I was doing in Perl when I wrote this. It seems to work though. The only command I've tested is the profile description one, although there's no reason why the others shouldn't work.
