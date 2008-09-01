/*
 * Copyright (c) 2008, Piccolo2D project, http://piccolo2d.org
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided
 * that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list of conditions
 * and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions
 * and the following disclaimer in the documentation and/or other materials provided with the
 * distribution.
 *
 * None of the name of the Piccolo2D project, the University of Maryland, or the names of its contributors
 * may be used to endorse or promote products derived from this software without specific prior written
 * permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
 * TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package org.piccolo2d.svg;

import java.awt.geom.GeneralPath;
import java.text.ParseException;

import org.piccolo2d.svg.util.RagelParser;

/** <a href="http://research.cs.queensu.ca/~thurston/ragel/">Ragel</a> parser 
 * for <a href="http://www.w3.org/TR/SVG11/paths.html#PathDataBNF">paths</a> - This file is auto-generated by rl2java.sh.
 * <p>
 * DO NOT EDIT MANUALLY!!!
 * </p>
 * See also https://lib2geom.svn.sourceforge.net/svnroot/lib2geom/lib2geom/trunk/src/2geom/svg-path-parser.rl
 */
class PathParser implements RagelParser {
%%{

	machine path;

	#######################################################
	## Define the actions
	#######################################################

	action start_number {
		start = p;
	}

	action push_number {
		argv[argc++] = Float.parseFloat(new String(data, start, p - start));
		start = -1;
	}

	action push_true {
		if(true)
			throw new UnsupportedOperationException("ragel action push_true isn't implemented yet.");
	}

	action push_false {
		if(true)
			throw new UnsupportedOperationException("ragel action push_false isn't implemented yet.");
	}

	action mode_abs {
		absolute = true;
	}

	action mode_rel {
		absolute = false;
	}
    
	action moveto {
		pb.moveTo(absolute, argv[0], argv[1]);
		argc = 0;
	}    

	action lineto {
		pb.lineTo(absolute, argv[0], argv[1]);
		argc = 0;
	}

	action horizontal_lineto {
		pb.hlineTo(absolute, argv[0]);
		argc = 0;
	}

	action vertical_lineto {
		pb.vlineTo(absolute, argv[0]);
		argc = 0;
	}

	action curveto {
		pb.cubicTo(absolute, argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
		argc = 0;
	}

	action smooth_curveto {
		pb.smoothCubicTo(absolute, argv[0], argv[1], argv[2], argv[3]);
		argc = 0;
	}

	action quadratic_bezier_curveto {
		pb.quadTo(absolute, argv[0], argv[1], argv[2], argv[3]);
		argc = 0;
	}

	action smooth_quadratic_bezier_curveto {
		pb.smoothQuadTo(absolute, argv[0], argv[1]);
		argc = 0;
	}

	action elliptical_arc {
		if(true)
			throw new UnsupportedOperationException("ragel action elliptical_arc isn't implemented yet.");
		argc = 0;
	}
        
	action closepath {
		pb.closePath();		
	}

	#######################################################
	## Define the grammar
	#######################################################

		wsp = (' ' | 9 | 10 | 13);
        sign = ('+' | '-');
        digit_sequence = digit+;
        exponent = ('e' | 'E') sign? digit_sequence;
        fractional_constant =
            digit_sequence? '.' digit_sequence
            | digit_sequence '.';
        floating_point_constant =
            fractional_constant exponent?
            | digit_sequence exponent;
        integer_constant = digit_sequence;
        comma = ',';
        comma_wsp = (wsp+ comma? wsp*) | (comma wsp*);

        flag = ('0' %push_false | '1' %push_true);
        
        number =
            ( sign? integer_constant
            | sign? floating_point_constant )
            >start_number %push_number;

        nonnegative_number =
            ( integer_constant
            | floating_point_constant)
            >start_number %push_number;

        coordinate = number $(number,1) %(number,0);
        coordinate_pair = (coordinate $(coordinate_pair_a,1) %(coordinate_pair_a,0) comma_wsp? coordinate $(coordinate_pair_b,1) %(coordinate_pair_b,0)) $(coordinate_pair,1) %(coordinate_pair,0);
        elliptical_arc_argument =
            (nonnegative_number $(elliptical_arg_a,1) %(elliptical_arg_a,0) comma_wsp?
             nonnegative_number $(elliptical_arg_b,1) %(elliptical_arg_b,0) comma_wsp?
             number comma_wsp
             flag comma_wsp flag comma_wsp
             coordinate_pair)
            %elliptical_arc;
        elliptical_arc_argument_sequence =
            elliptical_arc_argument $1 %0
            (comma_wsp? elliptical_arc_argument $1 %0)*;
        elliptical_arc =
            ('A' %mode_abs| 'a' %mode_rel) wsp*
            elliptical_arc_argument_sequence;
        
        smooth_quadratic_bezier_curveto_argument =
            coordinate_pair %smooth_quadratic_bezier_curveto;
        smooth_quadratic_bezier_curveto_argument_sequence =
            smooth_quadratic_bezier_curveto_argument $1 %0
            (comma_wsp?
             smooth_quadratic_bezier_curveto_argument $1 %0)*;
        smooth_quadratic_bezier_curveto =
            ('T' %mode_abs| 't' %mode_rel) wsp*
             smooth_quadratic_bezier_curveto_argument_sequence;

        quadratic_bezier_curveto_argument =
            (coordinate_pair $1 %0 comma_wsp? coordinate_pair)
            %quadratic_bezier_curveto;
        quadratic_bezier_curveto_argument_sequence =
            quadratic_bezier_curveto_argument $1 %0
            (comma_wsp? quadratic_bezier_curveto_argument $1 %0)*;
        quadratic_bezier_curveto =
            ('Q' %mode_abs| 'q' %mode_rel) wsp* 
            quadratic_bezier_curveto_argument_sequence;

        smooth_curveto_argument =
            (coordinate_pair $1 %0 comma_wsp? coordinate_pair)
            %smooth_curveto;
        smooth_curveto_argument_sequence =
            smooth_curveto_argument $1 %0
            (comma_wsp? smooth_curveto_argument $1 %0)*;
        smooth_curveto =
            ('S' %mode_abs| 's' %mode_rel)
            wsp* smooth_curveto_argument_sequence;

        curveto_argument =
            (coordinate_pair $1 %0 comma_wsp?
             coordinate_pair $1 %0 comma_wsp?
             coordinate_pair) 
            %curveto;
        curveto_argument_sequence =
            curveto_argument $1 %0
            (comma_wsp? curveto_argument $1 %0)*;
        curveto =
            ('C' %mode_abs| 'c' %mode_rel)
            wsp* curveto_argument_sequence;

        vertical_lineto_argument = coordinate %vertical_lineto;
        vertical_lineto_argument_sequence =
            vertical_lineto_argument $(vertical_lineto_argument_a,1) %(vertical_lineto_argument_a,0)
            (comma_wsp? vertical_lineto_argument $(vertical_lineto_argument_b,1) %(vertical_lineto_argument_b,0))*;
        vertical_lineto =
            ('V' %mode_abs| 'v' %mode_rel)
            wsp* vertical_lineto_argument_sequence;

        horizontal_lineto_argument = coordinate %horizontal_lineto;
        horizontal_lineto_argument_sequence =
            horizontal_lineto_argument $(horizontal_lineto_argument_a,1) %(horizontal_lineto_argument_a,0)
            (comma_wsp? horizontal_lineto_argument $(horizontal_lineto_argument_b,1) %(horizontal_lineto_argument_b,0))*;
        horizontal_lineto =
            ('H' %mode_abs| 'h' %mode_rel)
            wsp* horizontal_lineto_argument_sequence;

        lineto_argument = coordinate_pair %lineto;
        lineto_argument_sequence =
            lineto_argument $1 %0
            (comma_wsp? lineto_argument $1 %0)*;
        lineto =
            ('L' %mode_abs| 'l' %mode_rel) wsp*
            lineto_argument_sequence;

        closepath = ('Z' | 'z') %closepath;

        moveto_argument = coordinate_pair %moveto;
        moveto_argument_sequence =
            moveto_argument $1 %0
            (comma_wsp? lineto_argument $1 %0)*;
        moveto =
            ('M' %mode_abs | 'm' %mode_rel)
            wsp* moveto_argument_sequence;

        drawto_command =
            closepath | lineto |
            horizontal_lineto | vertical_lineto |
            curveto | smooth_curveto |
            quadratic_bezier_curveto |
            smooth_quadratic_bezier_curveto |
            elliptical_arc;

        drawto_commands = drawto_command (wsp* drawto_command)*;
        moveto_drawto_command_group = moveto wsp* drawto_commands?;
        moveto_drawto_command_groups =
            moveto_drawto_command_group
            (wsp* moveto_drawto_command_group)*;

        svg_path = wsp* moveto_drawto_command_groups? wsp*;

        main := svg_path;
}%%

%% write data;

	final GeneralPath parse(final CharSequence data) throws ParseException {
		return parse(data.toString().toCharArray());
	}

	final GeneralPath parse(final CharSequence data, final PathBuilder pb) throws ParseException {
		return parse(data.toString().toCharArray(), pb);
	}

	final GeneralPath parse(final char[] data) throws ParseException {
		return parse(data, new PathBuilder());
	}
	
	final GeneralPath parse(final char[] data, final PathBuilder pb) throws ParseException {
		if(data == null)
			return pb.toPath();
		// high-level buffers
		int start = -1;
		final float[] argv = new float[7];
		int argc = 0;
		boolean absolute = true;		
		
		// ragel variables (low level)
		final int pe = data.length;
		final int eof = pe;
		int cs, p = 0;
		int top;

		%% write init;
		%% write exec;

		if ( cs < path_first_final )
			throw new ParseException(new String(data), p);
        return pb.toPath();
	}
}
