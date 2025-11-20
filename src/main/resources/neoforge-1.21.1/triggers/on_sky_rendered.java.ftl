<#include "procedures.java.ftl">
@EventBusSubscriber(Dist.CLIENT) public class ${name}Procedure {
	@SubscribeEvent public static void onSkyRendered(RenderLevelStageEvent event) {
		Minecraft mc = Minecraft.getInstance();
		<#assign dependenciesCode>
			<@procedureDependenciesCode dependencies, {
				"x": "mc.player.getX()",
				"y": "mc.player.getY()",
				"z": "mc.player.getZ()",
				"world": "mc.player.level()",
				"entity": "mc.player",
				"poseStack": "event.getPoseStack()",
				"skyRenderEvent": "event",
				"event": "event"
			}/>
		</#assign>
		if (event.getStage() == RenderLevelStageEvent.Stage.AFTER_SKY)
		    execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}