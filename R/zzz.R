.onAttach = function(libname, pkgname) {
    version = packageDescription(pkgname, fields = "Version")

    msg = paste0("=========================================================================
", pkgname, " version ", version, "
Github page: https://github.com/ShixiangWang/UCSCXenaTools
Documentation: https://github.com/ShixiangWang/UCSCXenaTools
If you use it in published research, please cite:
Wang, Shixiang, et al. \"APOBEC3B and APOBEC mutational signature
    as potential predictive markers for immunotherapy
    response in non-small cell lung cancer.\" Oncogene (2018).
=========================================================================
                 ")
    packageStartupMessage(msg)
}