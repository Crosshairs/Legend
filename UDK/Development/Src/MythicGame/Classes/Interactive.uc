class Interactive extends Actor
	config(Interactives)
	placeable
	abstract;

var PlayerController PlayerInteractor;

struct InteractionInfo
{
	var config name Alias;
	var config class<Skill> InvolvedSkill;
	config delegate Execute();
};

var config array<InteractionInfo> Interactions;

DefaultProperties
{
}
