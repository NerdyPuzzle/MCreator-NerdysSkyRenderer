fogRenderEvent.setNearPlaneDistance(${opt.toFloat(input$start)});
fogRenderEvent.setFarPlaneDistance(${opt.toFloat(input$end)});
if (!fogRenderEvent.isCanceled()) {
  fogRenderEvent.setCanceled(true);
}