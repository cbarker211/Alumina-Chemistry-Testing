# This run directory is for GEOS-Chem Classic.

## For instructions on setting up, compiling, and running GEOS-Chem Classic, see:

  - https://geos-chem.readthedocs.org

## For additional information about GEOS-Chem, see:

  - http://wiki.geos-chem.org

  - http://geos-chem.org

## For help with GEOS-Chem Classic, see:

  - https://geos-chem.readthedocs.io/en/latest/reference/SUPPORT.html

  - https://geos-chem.readthedocs.io/en/latest/reference/CONTRIBUTING.html

Run directory to test out new alumina chemistry in the latest version of the model (v14.3.0).
Log files split into testing (test runs, see book notes) and chem_check (comparing runs with/without changes to check code is OK).
As we have advanced to a new version of the model and new species have been added, we have to use a new restart file for v14.3.0.
Added a new AL2O3 species to this restart file (conc=0, see Restarts/add_species.py), and symbolic link for this to start from 1/1/20.

geoschem.config.yml
  - Updated timings
  - Updated cloud_j input file location
  - added AL2O3 as a transported species
  - added an activate alumina flag

HEMCO_Config.rc.gmao_metfields
  - Updated end date for LightNOx

HEMCO_Config.rc
  - Added rocket inventories and scale factors
  - Changed GC Restart flag from EYFO to C to allow for symlinked file

HEMCO_Diag
  - Added diagnostics for the rocket emissions

HISTORY.rc
  - Aerosol turned on
  - ConcAfterChem turned on
  - RRTMG outputs changed to include TOA, Trop and AOD
  - Changed timings to 1 day to compare with/without new alumina chemistry.

norrtmg_aluminachem
  - This run is with the new alumina chemistry, but without any rocket emissions and without RRTMG.

norrtmg_normalchem
  - This run is the same as above but with the standard GEOS-Chem chemistry.
  - This run requires a different version of:
    - species_database.yml: no alumina
    - geoschem_config.yml : no alumina flag or alumina as transported species
    - HISTORY.rc          : updated output locations
