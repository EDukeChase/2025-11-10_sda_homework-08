# R Scripts

This directory contains all R scripts used for project setup and automation.

`setup.R`

**Purpose:** This is the main project setup script.

This file is sourced by the main `.qmd` document (in the setup chunk) every time the project is rendered. Its job is to:

-   Load all necessary R packages (library(...)).
-   Set global knitr chunk options (knitr::opts_chunk\$set(...)).
-   Define global plot settings (like the theme_set and color-blind friendly palettes).
-   Contain helper functions (like cache_computation) that are used in the analysis.

`initialize_project.R`

**Purpose:** This is a one-time automation script.

DO NOT run this file in a normal homework assignment. Its only job is to be run once when you first create a new project from the template.

It performs the following setup tasks:

-   Renames the generic .Rproj file to match the new repository name.
-   Renames the generic starter .qmd file to match the new repository name.
-   Overwrites the main README.md file with the project-specific template.
-   Removes the README.md files from the data/ and output/ sub-directories.
-   Prints a final instruction to restart the RStudio session.
