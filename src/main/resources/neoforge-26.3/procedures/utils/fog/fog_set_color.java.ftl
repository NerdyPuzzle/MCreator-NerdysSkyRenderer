private static int fogColor = -1;

@SubscribeEvent
public static void setFogColor(ViewportEvent.ComputeFogColor event) {
    if (fogColor != -1) {
        event.setRed(Mth.clamp(Mth.lerp(0.5F, Mth.clamp(event.getRed(), 0.0F, 1.0F), (fogColor >> 16 & 255) / 255.0F), 0.0F, 1.0F));
        event.setGreen(Mth.clamp(Mth.lerp(0.5F, Mth.clamp(event.getGreen(), 0.0F, 1.0F), (fogColor >> 8 & 255) / 255.0F), 0.0F, 1.0F));
        event.setBlue(Mth.clamp(Mth.lerp(0.5F, Mth.clamp(event.getBlue(), 0.0F, 1.0F), (fogColor & 255) / 255.0F), 0.0F, 1.0F));
        fogColor = -1;
    }
}