# 1. Use official Go image
FROM golang:1.21 as builder

# 2. Set working directory
WORKDIR /app

# 3. Copy Go code and static HTML files
COPY . .

# 4. Build the Go app
RUN go build -o server

# 5. Use a minimal final image
FROM debian:bookworm-slim

# 6. Set working dir in final image
WORKDIR /app

# 7. Copy built Go binary and HTML files
COPY --from=builder /app/server /app/
COPY --from=builder /app/src /app/src

# 8. Set port and command
EXPOSE 3000
CMD ["./server"]

