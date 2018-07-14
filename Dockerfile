FROM techbureau/catapult-tools:gcc-0.1.0.2
RUN apt update
RUN apt install -y ruby ruby-dev make g++
RUN apt install -y xemacs21
RUN gem install kubeclient mustache --no-ri --no-rdoc
ADD ./pod-code /pod-code