echo "[Step 1.5] Build ISL..."
  cd ${DOWNLOADDIR}
  if [ ! -f isl-${ISL_VERSION}.tar.xz ]; then
	curl -L -O http://ftp.slackware.com/pub/slackware/slackware64-current/source/l/isl/-${ISL_VERSION}.tar.xz
  fi
  tar xJf isl-${ISL_VERSION}.tar.xz -C ${SRCDIR}
  rm -rf ${BUILDDIR}/isl-${ISL_VERSION}
  mkdir -p ${BUILDDIR}/isl-${ISL_VERSION}
  cd ${BUILDDIR}/isl-${ISL_VERSION}
  ../${SRCRELDIR}/isl-${ISL_VERSION}/configure --build=${HOST_NATIVE} --host=${HOST_NATIVE} --prefix=${INSTALLDIR} --disable-shared --with-gmp-prefix=${INSTALLDIR}
  make ${JOBS}
  make install
fi
