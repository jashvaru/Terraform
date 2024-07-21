terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    token = "TOKEN"
}

resource "github_repository" "firstRepoUsingTf" {
  name        = "firstRepoUsingTf"
  description = "My awesome codebase"

  visibility = "public"

}