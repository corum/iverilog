#!/usr/bin/env sh

echo "Using the bundled ivtest to run regression tests."
echo " pwd = $(pwd)"

cd ivtest

version=v11

status=0
if [ "$OS" = 'Windows_NT' ]; then
  perl update_msys2_report.pl $version
  perl vvp_reg.pl || status=1
else
  perl vvp_reg.pl || status=1
fi

perl vpi_reg.pl || status=1

exit $status
