# Output Folder

This folder is the designated location for all generated files from your analysis. This includes:

  - Saved plots (`.png`, `.jpeg`, etc.)

  - Processed data tables (`.csv`)

  - Cached analysis results (`.rds`) from the `cache_computation()` function.

Important: This entire folder (except for this README file) is listed in the `.gitignore file`. Its contents are not and should not be tracked by Git.

The principle of reproducibility means that all files in this folder should be able to be recreated by running the code in the main `.qmd` document. This README file exists solely to ensure Git tracks this otherwise empty directory.
