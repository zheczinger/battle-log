proc do
  raise 'This plugin requires PSDK .26.52 or newer' if PSDK_VERSION < 6708

  check_methods = proc do |k, method_names|
    name_conflicts = method_names.find_all { |n| k.method_defined?(n) }.map { |n| "#{k}.#{n}" }
    raise "Name conflict with #{name_conflicts.join(', ')}" unless name_conflicts.empty?
  end

  check_singleton_methods = proc do |km, method_names|
    name_conflicts = method_names.find_all { |n| km.singleton_methods.include?(n) }.map { |n| "#{km}.#{n}" }
    raise "Name conflict with #{name_conflicts.join(', ')}" unless name_conflicts.empty?
  end

  check_methods.call(BattleUI::PlayerChoice, %i[zv_trigger_choice_history])
  check_methods.call(Battle::Scene, %i[zv_log zv_choose_history])
  check_methods.call(Battle::Visual, %i[zv_show_history_choice])
  check_methods.call(GamePlay, %i[zv_open_battle_history])
  check_singleton_methods.call(GamePlay, %i[zv_battle_history_class zv_battle_history_class=])
end.call
