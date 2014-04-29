INSTALLBUILDERCLI="/Applications/Bitrock InstallBuilder Enterprise 8.6.0/bin/Builder.app/Contents/MacOS/installbuilder.sh"
PATHTOBUILDFILE="flickrdownloadr.xml"
PATHTOLICENSEFILE="flickrdownloadrlicense.xml"

PLATFORM="mac"
if [ $# = 1 ]; then
  PLATFORM=$1
fi

PACKVARIABLE="pack_${PLATFORM}_platform_files"

if [ -f $PATHTOLICENSEFILE ]; then
  EXECCOMMAND="'$INSTALLBUILDERCLI' build $PATHTOBUILDFILE $PLATFORM --license $PATHTOLICENSEFILE --setvars project.version=$BUILDNUMBER $PACKVARIABLE=true"
else
  EXECCOMMAND="'$INSTALLBUILDERCLI' build $PATHTOBUILDFILE $PLATFORM --setvars project.version=$BUILDNUMBER $PACKVARIABLE=true"
fi

echo "About to execute: $EXECCOMMAND"

eval $EXECCOMMAND