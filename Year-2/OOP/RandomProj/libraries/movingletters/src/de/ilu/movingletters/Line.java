/*
 Copyright (C) 2007 Andre Seidelt, All Rights Reserved.

 This software is provided 'as-is', without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from the
 use of this software.

 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
 freely, subject to the following restrictions:

 1. The origin of this software must not be misrepresented; you must not
 claim that you wrote the original software. If you use this software in
 a product, an acknowledgment in the product documentation would be
 appreciated but is not required.

 2. Altered source versions must be plainly marked as such, and must not be
 misrepresented as being the original software.

 3. This notice may not be removed or altered from any source distribution.
 */
package de.ilu.movingletters;

import processing.core.PApplet;

/**
 * a line for a letter.
 * 
 * @author iluvatar
 * @version 20071119
 */
class Line {
	/** start of line (as index to real coordinates) */
	private int mStart;

	/** end of line (as index to real coordinates) */
	private int mEnd;

	/** reference to letters */
	private MovingLetters mMovingLetters;

	/**
	 * create a line with letter coordinates.
	 * 
	 * @param pMovingLetters
	 *            the reference to the letters instance.
	 * @param pStart
	 *            start of line as letter coordinate.
	 * @param pEnd
	 *            end of line as letter coordinate.
	 */
	Line(MovingLetters pMovingLetters, int pStart, int pEnd) {
		mStart = pStart - 1;
		mEnd = pEnd - 1;
		mMovingLetters = pMovingLetters;
	}

	/**
	 * draw this line.
	 * 
	 * @param pBaseX
	 *            x-base position of letter coordinate 0.
	 * @param pBaseY
	 *            y-base position of letter coordinate 0.
	 * @param pDotSize
	 *            size of dots at start and end. 0 for no dot.
	 * @param pLineWidth
	 *            line width.
	 */
	void paint(int pBaseX, int pBaseY, int pDotSize, int pLineWidth) {
		PApplet gfx = mMovingLetters.getRuntime();
		if (pDotSize > 0) {
			gfx.strokeWeight(pDotSize);
			gfx.point(mMovingLetters.getX(mStart) + pBaseX, mMovingLetters.getY(mStart) + pBaseY);
			gfx.point(mMovingLetters.getX(mEnd) + pBaseX, mMovingLetters.getY(mEnd) + pBaseY);
		}
		gfx.strokeWeight(pLineWidth);
		gfx.line(mMovingLetters.getX(mStart) + pBaseX, mMovingLetters.getY(mStart) + pBaseY, mMovingLetters.getX(mEnd) + pBaseX,
				mMovingLetters.getY(mEnd) + pBaseY);
	}

	/**
	 * get the width of the line in the letter coordinate space. may be 1, 2 or 3.
	 * 
	 * @return the width of the line.
	 */
	int getWidth() {
		int ret = 0;

		switch (mStart) {
		case 1:
		case 4:
		case 7:
		case 10:
		case 13:
			ret = PApplet.max(ret, 2);

		case 2:
		case 5:
		case 8:
		case 11:
		case 14:
			ret = PApplet.max(ret, 3);

		default:
			ret = PApplet.max(ret, 1);
		}

		switch (mEnd) {
		case 1:
		case 4:
		case 7:
		case 10:
		case 13:
			ret = PApplet.max(ret, 2);

		case 2:
		case 5:
		case 8:
		case 11:
		case 14:
			ret = PApplet.max(ret, 3);

		default:
			ret = PApplet.max(ret, 1);
		}

		return ret;
	}
}
