## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(eval = TRUE)

## -----------------------------------------------------------------------------
library(cgvR)

## -----------------------------------------------------------------------------
nodes <- 1:8
edges <- cbind(
  c(1,2,3,4, 5,6,7,8, 1,2,3,4),
  c(2,3,4,1, 6,7,8,5, 5,6,7,8)
)

# corner coordinates of a unit cube, scaled
pos <- matrix(c(
  -1,-1,-1,   1,-1,-1,   1, 1,-1,  -1, 1,-1,
  -1,-1, 1,   1,-1, 1,   1, 1, 1,  -1, 1, 1
), ncol = 3, byrow = TRUE) * 5

## ----eval = FALSE-------------------------------------------------------------
# v <- cgv_viewer(800, 600, "cube")
# cgv_background(v, "black")
# cgv_set_graph(v, nodes, edges,
#               positions   = pos,
#               node_values = as.double(seq_len(8)),
#               node_sizes  = rep(20, 8))
# cgv_camera(v, position = c(15, 12, 18), target = c(0, 0, 0))
# cgv_run(v)

## -----------------------------------------------------------------------------
set.seed(1)
n <- 60L
# random tree + a few extra edges
ef <- 1L; et <- integer(0)
for (i in 2:n) { ef <- c(ef, sample.int(i - 1, 1)); et <- c(et, i) }
ef <- c(ef, sample.int(n, 20)); et <- c(et, sample.int(n, 20))
edges <- cbind(ef[seq_len(min(length(ef), length(et)))],
               et[seq_len(min(length(ef), length(et)))])

pos <- cgv_layout_fr(n, edges, n_iter = 200L, seed = 42L)
str(pos)

## ----eval = FALSE-------------------------------------------------------------
# v <- cgv_viewer(1000, 700, "FR layout")
# cgv_set_graph(v, seq_len(n), edges,
#               positions   = pos,
#               node_values = as.double(seq_len(n)),
#               node_sizes  = rep(10, n))
# cgv_camera(v, position = c(20, 16, 24), target = c(0, 0, 0))
# cgv_run(v)

## ----eval = FALSE-------------------------------------------------------------
# pos <- cgv_layout_fr_bh(5000L, edges_big, n_iter = 200L, seed = 1L)

## ----eval = FALSE-------------------------------------------------------------
# v <- cgv_viewer(1000, 700, "path demo")
# cgv_set_graph(v, seq_len(n), edges, positions = pos,
#               node_values = as.double(seq_len(n)),
#               node_sizes  = rep(8, n))
# 
# cgv_highlight_path(v, c(1, 5, 17, 42), color = "#FF2200",
#                    node_scale = 2.0, edge_width = 4.0)
# 
# # remove the highlight again:
# # cgv_clear_path(v)
# 
# cgv_run(v)

## ----eval = FALSE-------------------------------------------------------------
# v <- cgv_viewer(1000, 700, "camera demo")
# cgv_set_graph(v, seq_len(n), edges, positions = pos,
#               node_sizes = rep(8, n))
# 
# cgv_camera_mode(v, "orbit")
# cgv_fly_path(v, c(1, 17, 42, 5, 1), duration = 6.0)
# cgv_run(v)

## ----eval = FALSE-------------------------------------------------------------
# v <- cgv_viewer(1280, 720, "record demo", offscreen = TRUE)
# cgv_set_graph(v, seq_len(n), edges, positions = pos,
#               node_sizes = rep(8, n))
# cgv_camera(v, position = c(20, 16, 24), target = c(0, 0, 0))
# 
# cgv_record_start(v, "demo.mp4", fps = 30)
# cgv_run(v, n_frames = 90L)        # 3 seconds at 30 fps
# cgv_record_stop(v)

## ----eval = FALSE-------------------------------------------------------------
# v <- cgv_viewer(640, 480, offscreen = TRUE)
# cgv_set_graph(v, nodes, edges, positions = pos)
# cgv_run(v, n_frames = 1L)
# cgv_close(v)

