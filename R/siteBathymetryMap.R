library(ggOceanMaps)
library(ggspatial)
# basemap(limits = 60)
# basemap(limits = c(-20, 20, 40, 59))
# dt <- data.frame(lon = c(160, 160, -160, -160), lat = c(60, 80, 80, 60))
#
# basemap(limits = c(160, -160, 60, 80)) +
#   ggspatial::geom_spatial_polygon(
#     data = dt,
#     aes(x = lon, y = lat), fill = NA, color = "red")
#
# basemap(limits = 60, projection.grid = TRUE, grid.col = "red")
#
# basemap(limits = c(-2e6, 1e6, 0, 3e6), shapefiles = "Arctic")
#
# dt <- expand.grid(lon = c(160, -160), lat = c(60, 80))
#
# basemap(data = dt) + # a synonym: basemap(dt)
#   ggspatial::geom_spatial_point(data = dt, aes(x = lon, y = lat), color = "red")
#
# basemap(limits = c(-125, -110, 25, 35), bathymetry = TRUE)
#
# basemap(limits = c(-125, -110, 25, 35), bathy.style = "rcb") # synonym to "raster_continuous_blues"

basemap(limits = c(165, 180, -48, -33), bathy.style = "rcb") # synonym to "raster_continuous_blues"
