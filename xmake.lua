add_rules("mode.debug", "mode.release")
if is_mode("debug") then
    set_runtimes("MDd")
    add_requires("opengl", {debug = true})
    add_requires("imgui", {debug = true, configs = {glfw = true, opengl3 = true}})
else
    set_runtimes("MD")
    add_requires("opengl")
    add_requires("imgui", {configs = {glfw = true, opengl3 = true}})
end
target("TerrainGenerator")
    set_kind("binary")
    add_cxflags(
        "cl::/utf-8"
    )
    set_warnings("allextra")
    add_packages("opengl", "imgui")
    if is_mode("debug") then
        add_defines("_DEBUG")
        set_symbols("debug", "edit")
    else
        -- if is_plat("windows") then
        --     add_ldflags("-subsystem:windows", {force = true})
        -- end
    end
    set_languages("clatest", "cxxlatest")
    add_headerfiles("src/**.h")
    add_files("src/*.cpp")