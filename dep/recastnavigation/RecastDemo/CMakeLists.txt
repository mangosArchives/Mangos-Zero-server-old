CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

SET(recastdemo_SRCS
    Source/ChunkyTriMesh.cpp
    Source/ConvexVolumeTool.cpp
    Source/CrowdManager.cpp
    Source/CrowdTool.cpp
    Source/Debug.cpp
    Source/Filelist.cpp
    Source/imgui.cpp
    Source/imguiRenderGL.cpp
    Source/InputGeom.cpp
    Source/main.cpp
    Source/MeshLoaderObj.cpp
    Source/NavMeshTesterTool.cpp
    Source/OffMeshConnectionTool.cpp
    Source/PerfTimer.cpp
    Source/Sample.cpp
    Source/Sample_Debug.cpp
    Source/Sample_SoloMeshSimple.cpp
    Source/Sample_SoloMeshTiled.cpp
    Source/Sample_TileMesh.cpp
    Source/SampleInterfaces.cpp
    Source/SlideShow.cpp
    Source/TestCase.cpp
    Source/ValueHistory.cpp
)

SET(recastdemo_HDRS
    Include/ChunkyTriMesh.h
    Include/ConvexVolumeTool.h
    Include/CrowdManager.h
    Include/CrowdTool.h
    Include/Debug.h
    Include/Filelist.h
    Include/imgui.h
    Include/imguiRenderGL.h
    Include/InputGeom.h
    Include/MeshLoaderObj.h
    Include/NavMeshTesterTool.h
    Include/OffMeshConnectionTool.h
    Include/PerfTimer.h
    Include/Sample.h
    Include/Sample_Debug.h
    Include/Sample_SoloMeshSimple.h
    Include/Sample_SoloMeshTiled.h
    Include/Sample_TileMesh.h
    Include/SampleInterfaces.h
    Include/SDLMain.h
    Include/SlideShow.h
    Include/TestCase.h
    Include/ValueHistory.h
)

FIND_PACKAGE(OpenGL REQUIRED)
IF(WIN32)
    FIND_LIBRARY(SDL_LIBRARY NAME SDL PATHS Contrib/SDL/lib)
    FIND_LIBRARY(SDLMAIN_LIBRARY NAME SDLmain PATHS Contrib/SDL/lib)
    SET(SDL_INCLUDE_DIR Contrib/SDL/include)
ELSE(WIN32)
    FIND_PACKAGE(SDL REQUIRED)
ENDIF(WIN32)

INCLUDE_DIRECTORIES(Include
    Contrib
    ../DebugUtils/Include
    ../Detour/Include
    ../Recast/Include
    ${SDL_INCLUDE_DIR}
)

IF(XCODE)
    ADD_EXECUTABLE(RecastDemo MACOSX_BUNDLE Source/SDLMain.m Include/SDLMain.h ${recastdemo_SRCS} ${recastdemo_HDRS})
ELSE(XCODE)
    ADD_EXECUTABLE(RecastDemo WIN32 ${recastdemo_SRCS} ${recastdemo_HDRS})
ENDIF(XCODE)

TARGET_LINK_LIBRARIES(RecastDemo DebugUtils Detour Recast ${SDL_LIBRARY} ${SDLMAIN_LIBRARY} ${OPENGL_LIBRARIES})

IF(MSVC)
    # Enable some linker optimisations
    SET_TARGET_PROPERTIES(RecastDemo PROPERTIES LINK_FLAGS_RELEASE "/OPT:REF /OPT:ICF")
    SET_TARGET_PROPERTIES(RecastDemo PROPERTIES LINK_FLAGS_MINSIZEREL "/OPT:REF /OPT:ICF")
    SET_TARGET_PROPERTIES(RecastDemo PROPERTIES LINK_FLAGS_RELWITHDEBINFO "/OPT:REF /OPT:ICF")
ENDIF(MSVC)

SET(EXECUTABLE_OUTPUT_PATH ${RecastNavigation_SOURCE_DIR}/RecastDemo/Bin)

