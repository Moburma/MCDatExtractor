# MCDatExtractor
Extractor of LEVELS.DAT/TAB files from Bullfrog's Magic Carpet games.

This script can extract the individual levels from Magic Carpet LEVELS.DAT and LEVELS.TAB files. This is required to edit and otherwise poke around in them, and actually doesn't help if you want to play them. The exception to this is if you want to play levels beyond 127 in Magic Carpet 2, if you extract all the levels with this tool, you can play them in the fan project REMC2 (https://github.com/thobbsinteractive/magic-carpet-2-hd) using its --custom_level argument if you feed it the full path to the individual level file.

# Usage

This script has no parameters, just run it in a directory with the LEVELS.DAT and LEVELS.TAB files from the LEVELS directory of any Magic Carpet game release.
Note this does NOT extract image .DAT/TAB formats, they work differently. Only levels!
