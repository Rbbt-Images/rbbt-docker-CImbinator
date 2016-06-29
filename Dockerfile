FROM mikisvaz/rbbt-basic
USER root
RUN echo "install.packages('Rcpp', repos='http://cran.us.r-project.org')" | R --vanilla
RUN wget 'https://cran.r-project.org/src/contrib/Archive/plyr/plyr_1.8.1.tar.gz' -O /tmp/plyr_1.8.1.tar.gz
RUN R CMD INSTALL /tmp/plyr_1.8.1.tar.gz
RUN wget 'https://cran.r-project.org/src/contrib/Archive/car/car_2.0-22.tar.gz' -O /tmp/car_2.0-22.tar.gz
RUN R CMD INSTALL /tmp/car_2.0-22.tar.gz
RUN echo "install.packages(c('digest', 'gtable', 'reshape2', 'scales', 'proto'), repos='http://cran.us.r-project.org')" | R --vanilla
RUN wget 'https://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_1.0.0.tar.gz' -O /tmp/ggplot2_1.0.0.tar.gz
RUN R CMD INSTALL /tmp/ggplot2_1.0.0.tar.gz
RUN echo "install.packages(c('RJSONIO', 'XML'), repos='http://cran.us.r-project.org')" | R --vanilla
RUN wget 'https://cran.r-project.org/src/contrib/Archive/gridSVG/gridSVG_1.3-1.tar.gz' -O /tmp/gridSVG_1.3-1.tar.gz
RUN R CMD INSTALL /tmp/gridSVG_1.3-1.tar.gz
RUN echo "install.packages(c('drc', 'Rserve'), repos='http://cran.us.r-project.org')" | R --vanilla
RUN wget 'https://cran.r-project.org/src/contrib/Archive/ggthemes/ggthemes_1.7.0.tar.gz' -O /tmp/ggthemes_1.7.0.tar.gz
RUN R CMD INSTALL /tmp/ggthemes_1.7.0.tar.gz
RUN gem install prawn prawn-svg
RUN apt-get update
RUN apt-get -y install libcairo2 libcairo2-dev
RUN echo "install.packages(c('Cairo'), repos='http://cran.us.r-project.org')" | R --vanilla
USER rbbt
ENV R_HOME /usr/lib/R
RUN rbbt workflow install CombinationIndex 
EXPOSE 2887
CMD ["rbbt", "workflow", "server", "CombinationIndex", "-e", "production", "-p", "2887", "-e", "development", "--log", "0"]
