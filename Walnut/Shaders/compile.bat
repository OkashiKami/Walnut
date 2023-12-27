@echo off

SET ARG=%1

IF DEFINED ARG (
    IF "%ARG%"=="-n" (
        glslc.exe -DVERTEX %~n2.glsl -o %~n2.vert.spv
        IF %ERRORLEVEL% NEQ 0 (
            echo Vertex shader compilation failed!
            pause
            exit /b 1
        )

        glslc.exe -DFRAGMENT %~n2.glsl -o %~n2.frag.spv
        IF %ERRORLEVEL% NEQ 0 (
            echo Fragment shader compilation failed!
            pause
            exit /b 1
        )

        echo Shaders compiled successfully!
    ) ELSE (
        echo Usage: compile.bat -n [filename]
        pause
        exit /b 1
    )
) ELSE (
    echo Missing argument!
    pause
    exit /b 1
)