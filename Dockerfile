FROM scratch
EXPOSE 80
WORKDIR /
CMD ["/app"]
COPY skeleton-docker-go-scratch /app
COPY static /static
