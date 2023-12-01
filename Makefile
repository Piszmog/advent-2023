init:
	@if [ -z "$(DAY)" ]; then \
		echo "Usage: make init DAY=1"; \
		exit 1; \
	fi
	@if [ -d "day$(DAY)" ]; then \
		echo "Day $(DAY) already exists"; \
		exit 1; \
	fi
	@echo "Initializing day $(DAY)..."
	@mkdir -p day$(DAY)
	@cd day$(DAY) && go mod init github.com/Piszmog/advent-2023/day$(DAY)
	@cd day$(DAY) && echo "package main\n\nfunc main() {\n\n}" > main.go
	@go work use ./day$(DAY)
run:
	@if [ -z "$(DAY)" ]; then \
		echo "Usage: make run DAY=1"; \
		exit 1; \
	fi
	@if [ ! -d "day$(DAY)" ]; then \
		echo "Day $(DAY) does not exist"; \
		exit 1; \
	fi
	@echo "Running day $(DAY)..."
	@cd day$(DAY) && go run main.go