.PHONY: lint
lint:
	yamllint .github/workflows/terraform.yml
