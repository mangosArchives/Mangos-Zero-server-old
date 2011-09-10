/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos-zero>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef _MMAP_DEBUG_H
#define _MMAP_DEBUG_H

#include <math.h>
#include "DetourNavMesh.h"
#include "Recast.h"
#include "ChunkyTriMesh.h"
#include "MeshLoaderObj.h"

//void duReadObjMesh(int mapID, rcInputGeom* geom);
void duReadNavMesh(char* tile, dtNavMesh* &navMesh);
int duReadHeightfield(char* tile, rcHeightfield* &hf);
int duReadCompactHeightfield(char* tile, rcCompactHeightfield* &chf);
int duReadContourSet(char* tile, rcContourSet* &cs);
int duReadPolyMesh(char* tile, rcPolyMesh* &mesh);
int duReadDetailMesh(char* tile, rcPolyMeshDetail* &mesh);

class myMeshLoaderObj
{
private:
	float* m_verts;
	int* m_tris;
	float* m_normals;
	int m_vertCount;
	int m_triCount;
	char m_filename[260];

public:
	myMeshLoaderObj();
	~myMeshLoaderObj();
	
	bool load(const char* fileName);

	inline const float* getVerts() const { return m_verts; }
	inline const float* getNormals() const { return m_normals; }
	inline const int* getTris() const { return m_tris; }
	inline int getVertCount() const { return m_vertCount; }
	inline int getTriCount() const { return m_triCount; }
	inline const char* getFileName() const { return m_filename; }
};

#endif
