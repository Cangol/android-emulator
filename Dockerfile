FROM cangol/android-gradle
LABEL MAINTAINER Cangol  <wxw404@gmail.com>

#android-wait-for-emulator
ENV PATH ${SDK_HOME}/bin:$PATH
RUN curl https://raw.githubusercontent.com/Cangol/android-gradle-docker/master/android-wait-for-emulator -o ${SDK_HOME}/bin/android-wait-for-emulator
RUN chmod u+x ${SDK_HOME}/bin/android-wait-for-emulator

#avdmanager create avd
RUN echo yes | $ANDROID_HOME/tools/bin/avdmanager create avd --force --name test -k  $ANDROID_IMAGES --device "Nexus 4" --sdcard 500M

RUN ${ANDROID_HOME}/tools/emulator -avd test -noaudio -no-window -gpu off &
RUN android-wait-for-emulator
