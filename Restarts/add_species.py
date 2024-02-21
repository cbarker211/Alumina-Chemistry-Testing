#!/usr/bin/env python
# Credit Sal Farina

import netCDF4 as nc
import sys
import os

for nam in sys.argv[1:]:
    f = nc.Dataset(nam,mode='a')
    try:
        o = f['SpeciesRst_OCPI']
    except:
        print("SpeciesRst_OCPI not defined")
    #f.createVariable('SpeciesRst_AL2O3',o.datatype,dimensions=o.dimensions)
    alumina = f['SpeciesRst_AL2O3']
    alumina[:] = 0.0
    alumina.long_name= 'Dry mixing ratio of species AL2O3'
    alumina.units =  o.units
    alumina.add_offset = 0.0
    alumina.scale_factor = 1.0
    alumina.missing_value = 1.0e30
    alumina.averaging_method = "instantaneous"
    f.close()