<#include "procedures.java.ftl">
@EventBusSubscriber(Dist.CLIENT) public class ${name}Procedure {
	@SubscribeEvent public static void onSkyRendered(ViewportEvent.RenderFog event) {
		Minecraft mc = Minecraft.getInstance();
		<#assign dependenciesCode>
			<@procedureDependenciesCode dependencies, {
				"x": "mc.player.getX()",
				"y": "mc.player.getY()",
				"z": "mc.player.getZ()",
				"world": "mc.player.level()",
				"entity": "mc.player",
				"fogStart": "event.getNearPlaneDistance()",
				"fogEnd": "event.getFarPlaneDistance()",
				"fogRenderEvent": "event",
				"event": "event"
			}/>
		</#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}