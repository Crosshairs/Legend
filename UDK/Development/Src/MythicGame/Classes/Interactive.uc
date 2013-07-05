class Interactive extends Actor
	config(Interactives)
	placeable
	abstract;

var PlayerController PlayerInteractor;

struct InteractionInfo
{
	var config name Alias;
	var config delegate<DoInteraction> Execute;
	var class<Skill> InvolvedSkill;
};

var config array<InteractionInfo> Interactions;

//template for 'Execute' Delegate
delegate bool DoInteraction()
{
	//default actions if not assigned to an interaction execute function
	return false;
}

DefaultProperties
{
}
