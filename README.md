# Calibration-Variant-Analysis
This repository contains the analysis and optimization of calibration variants for a specific imaging system. Through multiple iterations and adjustments to the stochastic model, different calibration variants are explored to determine the most suitable configuration for the imaging system. The analysis includes adjusting parameters, computing calibrations, and evaluating results based on various statistical measures.
# Calibration Variant Analysis

---

## Description:

This repository documents the analysis and optimization of calibration variants for a specific imaging system. The calibration variants are explored through multiple iterations and adjustments to the stochastic model to determine the most suitable configuration for the imaging system. The analysis includes adjusting parameters, computing calibrations, and evaluating results based on various statistical measures.

---

## Procedure:

1. **Initial Calibration (Variant 1):** Conduct an initial calibration of the imaging system with the default stochastic model.
2. **Variant 2:** Compute the calibration with a reduced model for distortion, focusing only on specific parameters.
3. **Variant 3:** Analyze the calibration parameters of Variant 1, set certain parameters constant, and compute the calibration again.
4. **Variant 4:** Utilize only a subset of images (5 images, including 1 front shot and 4 oblique shots) for calibration.
5. **Variant 5:** Use only 3 images from different viewpoints for calibration.

---

## Questions and Discussions:

1. **Optimization of Stochastic Model (Task 2a):** Explain and justify the approach used to optimize the stochastic model.
2. **Analysis of Variants:** List the relevant statistics of all tested variants and discuss special characteristics and differences observed between these variants. Relevant statistics include:
   - Number of images
   - Number of unknown orientation parameters
   - RMS-errors of residuals
   - Estimation of error of unit weight
   - Number of observations eliminated as blunders
   - Correlation between parameters

---

## Instructions:

- **File Editing:** For subtasks involving file editing (e.g., ImageList.txt), ensure necessary modifications are made.
- **Parameter Adjustment:** Adjust parameters of the stochastic model inside the batch file (-sl, -sC, -sZ) as needed for calibration variants.
- **Iteration:** Expect several iterations to find a suitable stochastic model for calibration.

---

## Note:

Ensure thorough documentation of each calibration variant and its corresponding analysis. For further clarification or assistance, refer to the documentation provided or seek guidance from the instructor.

---

This Read Me file provides an overview of the calibration variant analysis conducted in this repository. For detailed instructions and discussions regarding each variant, refer to the respective documentation within the repository.
