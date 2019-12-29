
\header {
  title = "(שפּיל זשע מיר) אַ לידעלע אין ייִדיש"
  subtitle = "Shpil Zhe Mir a Lidele in Yidish"
  }
\version "2.18.2"
\language "english"
#(set-global-staff-size 17)

end =
  #(define-music-function
    (parser location signature)
    (fraction?)
  #{
    \once \omit Staff.TimeSignature \time #signature
  #})

\layout {
  \context {  % Use Typewriter font for chord symbols
    \ChordNames {
      \set chordChanges = ##t
      \override ChordName.font-family = #'typewriter
      }
    }
  \context {  % Change font size for lyrics
    \Lyrics {
      \override LyricText.font-size = #'-1
      }
    }
  \context {  % Beam according to rhythm
    \Staff {
      \set Timing.beamExceptions = #'()
      }
    }
  }

\paper {      % Load fonts
  fonts = #
  (make-pango-font-tree
   "Linux Libertine"
   "Linux Biolinum"
   "Courier 10 Pitch"
   (/ (* staff-height pt) 2.5)
    )
  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5)
    \column {
      \fill-line { \fromproperty #'header:dedication }
      \override #'(baseline-skip . 3.5)
      \column {
        \fill-line {
          \override #'(font-name . "Drugulin CLM")
          \huge \larger \larger \bold
          \fromproperty #'header:title
          }
        \fill-line {
          \large \bold
          \fromproperty #'header:subtitle
          }
        \fill-line {
          \smaller \bold
          \fromproperty #'header:subsubtitle
          }
        \fill-line {
          \fromproperty #'header:meter
          \fromproperty #'header:arranger
          }
          \fill-line {
          \override #'(font-name . "Drugulin CLM")
          \fromproperty #'header:composer
          { \large \bold \fromproperty #'header:instrument }
          \override #'(font-name . "Drugulin CLM")
          \fromproperty #'header:poet
          }
        }
      }
    }
    scoreTitleMarkup = \markup {
      \column {
      \on-the-fly \print-all-headers { \bookTitleMarkup \hspace #1 }
      \fill-line {
        \null
        \override #'(font-name . "Drugulin CLM")
        \huge
        \lower #5
        \fromproperty #'header:piece
        }
      }
    }
  }

\score {
  <<
    \new ChordNames = "mainChords" {
      \chordmode { 
        g1:m |
        g:m |
        bf |
        bf: |
        g2:m bf: |
        f: c:m |
        g:m bf:7 |
        g1:m |
        g:m |
        c:m |
        ef: |
        bf: |
        g:7 |
        bf:7 |
        f2: bf:7 |
        g1:m
      }
    }
    \new Staff = "main" {
      \clef treble
      \key g \minor
      \time 4/4
      \tempo Moderato
      \new Voice = "melody" {
        \relative f'{ 
          g8 a bf c bf a g a |
          bf g~g4 r4. c8 |
          bf8 c d ef d c bf c | \break
          d8 bf~bf4 r4. d8 |
          
          << 
            { 
              d8 ef f ef f4. r8 |
              f ef d c g'4.\fermata c,8 |
            }
            <<
              \new ChordNames \with {
                alignAboveContext = #"mainChords"
              } 
              
                
                \chordmode { 
                  \override ChordName #'font-size = #-1 {
                  g1:m |
                  ef2: d:7 |
                }
              }
              \new Staff \with {
                \remove "Time_signature_engraver"
                alignAboveContext = #"mainChords"
                fontSize = #-3
                \override StaffSymbol.staff-space = #(magstep -3)
                \override StaffSymbol.thickness = #(magstep -3)
                firstClef = ##f
                \override VerticalAxisGroup.default-staff-staff-spacing =
                  #'((basic-distance . 10)
                     (minimum-distance . 10)
                     (padding . 1)
                     (stretchability . 10))
              } 
              
              \new Voice = "variation"
              \relative d''{
                d8 ef f g f ef d( c) |
                ef8 d8 c bf a4.\fermata c8 |
              }
            >>
          >>
          
          bf8 c d c bf f g af |
          g2. r4 |\bar "||"\break
          g'2 g |
          g4 f16( ef8.) f4. r8 |
          g8. f16 ef8 d ef f g ef |
          d2. r4 |
          f2 f4 r8 g |
          af g f ef d r d ef |
          f ef d c bf8. c16 bf8 af |
          g2. r4 \bar "|."
        }
      }
    }
    
    \new Lyrics \lyricsto "melody" {
      Shpil zhe mir a li -- de -- le in yi -- dish,
      der -- ve -- kn zol es freyd un nit keyn khi -- desh,
      az a -- le groys un kleyn,
      zol -- n es far -- shteyn,
      fun moyl tsu moyl dos li -- de -- le zol geyn!
      
      Shpil, shpil, klez -- merl, shpil,
      veyst dokh vos ikh meyn un vos ikh vil;
      shpil, shpil! A li -- de -- le far mir,
      shpil a li -- de -- le mit harts un mit ge -- fil!
    }
    
              \new Lyrics \with {
                alignAboveContext = #"variation"
              }
              \lyricsto "variation" 
              \lyricmode{ 
                a -- le men -- tshn groys un kleyn,
                zol -- n es far -- shteyn, fun
              }
  >>
}
