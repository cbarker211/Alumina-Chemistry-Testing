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
Log files split into:
  - testing (test runs, see book notes)
  - chem_check (comparing runs with/without changes to check code is OK).
  - stepping (another version of testing this time only changing a few files at a time)
  - 23_02_24 (latest version of stepping on the dust_test branch - now called feature/al2o3-update)
As we have advanced to a new version of the model and new species have been added, we have to use a new restart file for v14.3.0.
Added a new AL2O3 species to this restart file (conc=0, see Restarts/add_species.py), and symbolic link for this to start from 1/1/20.

geoschem.config.yml
  - Updated timings
  - Updated cloud_j input file location
  - added AL2O3 as a transported species

HEMCO_Config.rc.gmao_metfields
  - Updated end date for LightNOx

HEMCO_Config.rc
  - Added rocket inventories and scale factors.
  - Changed GC Restart flag from EYFO to C to allow for symlinked file.
  - For RRMTG sims, RRTMG turned on in NON-EMISSIONS DATA.

HEMCO_Diagn.rc
  - Added diagnostics for the rocket emissions

HISTORY.rc
  - Aerosol turned on.
  - ConcAfterChem turned on.
  - RRTMG outputs changed to include TOA, Trop and AOD for all species (ST added to AOD so its printed for all diags - see RRTMG notes in file).
  - Changed timings to 1 day to compare with/without new alumina chemistry.

aluminachem
  - This run is with the new alumina chemistry (feature/al2o3-update), but without any rocket emissions.

normalchem
  - This run is the same as above but with the standard GEOS-Chem chemistry.
  - This run requires a different version of:
    - species_database.yml: no alumina
    - geoschem_config.yml : no alumina as transported species
    - HISTORY.rc          : updated output locations
    - HEMCO_Config.rc stays the same.
