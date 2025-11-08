#' Initialize New Project from Template
#'
#' @description
#' This script automates the setup of a new project created from the template.
#' It renames generic files to match the new repository name and cleans up
#' the template-specific README files.
#'
#' @details
#' The script performs the following actions:
#'   1. Detects the new project's directory name.
#'   2. Renames the generic `.Rproj` and starter `.qmd` files.
#'   3. **Overwrites the main README.md** with the project-specific template.
#'   4. Removes README files from sub-directories.
#'   5. Prints a final instruction to restart the RStudio session.
#'
#' @return This function is called for its side effects and does not return a value.
#'
initialize_project <- function() {
  
  project_dir <- here::here()
  new_name <- basename(project_dir)
  
  message("New project name detected: '", new_name, "'")
  
  # --- 1. Rename the .Rproj file ---
  old_rproj_name <- "sda-hw_template.Rproj" # Adjust if your template name changes
  old_rproj_path <- here::here(old_rproj_name)
  
  if (file.exists(old_rproj_path)) {
    new_rproj_path <- here::here(paste0(new_name, ".Rproj"))
    file.rename(from = old_rproj_path, to = new_rproj_path)
    message("Renamed '", old_rproj_name, "' to '", basename(new_rproj_path), "'")
  } else {
    message("No '", old_rproj_name, "' found. Skipping .Rproj rename.")
  }
  
  # --- 2. Rename the starter .qmd file ---
  old_qmd_name <- list.files(path = project_dir, pattern = "-num\\.qmd$")
  
  if (length(old_qmd_name) == 1) {
    old_qmd_path <- here::here(old_qmd_name)
    new_qmd_path <- here::here(paste0(new_name, ".qmd"))
    file.rename(from = old_qmd_path, to = new_qmd_path)
    message("Renamed '", old_qmd_name, "' to '", basename(new_qmd_path), "'")
  } else {
    message("Could not find a unique '...-num.qmd' file. Skipping .qmd rename.")
  }
  
  # --- 3. Overwrite the main README.md file ---
  main_readme_path <- here::here("README.md")
  if (file.exists(main_readme_path)) {
    readme_lines <- readLines(main_readme_path)
    template_start_line <- grep("# Template README.md for Projects", readme_lines, fixed = TRUE)
    
    if (length(template_start_line) == 1) {
      new_readme_content <- readme_lines[template_start_line:length(readme_lines)]
      # The first line of the new content is the header, which we don't need
      new_readme_content <- new_readme_content[-1] 
      writeLines(new_readme_content, main_readme_path)
      message("Overwrote main README.md with project-specific template.")
    }
  }
  
  # --- 4. Remove sub-directory README files ---
  readme_files_to_remove <- c("data/README.md", "output/README.md")
  
  for (file_path in readme_files_to_remove) {
    full_path <- here::here(file_path)
    if (file.exists(full_path)) {
      file.remove(full_path)
      message("Removed template file: '", file_path, "'")
    }
  }
  
  # --- 5. Final instruction ---
  message("\nIMPORTANT: Project initialization complete. Please close and reopen this project.")
  message("Use 'File > Open Project...' and select the new '", new_name, ".Rproj' file.")
  
}

# Automatically run the function when the script is sourced
initialize_project()