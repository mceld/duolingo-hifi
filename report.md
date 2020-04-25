# Hi-fi Prototype Evaluation

******

## Prototype Links and Documentation

[Github Repository](https://github.com/lwm2120/duolingo-hifi)

All documentation regarding the set-up of this prototype is contained within this repository's <b>README.</b>  Testing script and the list of tasks are described in the overview and throughout the page.

******

### Overview

The same three users that assisted in testing the lo-fi iteration of this system assisted in testing the hi-fi iteration.  The prototype was displayed on the same touchscreen laptop, but at a desk, rather than in tablet mode.  Testing used the same third-party, screen-marking application ([Epic Pen](https://epic-pen.com/)) from before, but users were not required to switch between marking and clicking, these actions were performed by the practitioner via hotkeys on a keyboard wired into the laptop and placed away from the user testing area (users were only required to tap the screen once to ensure the prototype's window was in focus after finishing a screen-marking task).  Testing covered all features (i.e. navigation, typographical arrangement, interaction, and potential for learning) of the prototype.  Potential backend features that might drive the recognition and assessment of user-generated writing were not implemented or tested.

### Procedure and Participant Tasks

Tasks were structured similarly to the tasks used during lo-fi testing, though they differed greatly in their phenomenology because of the changes made to the Epic Pen protocol; natural interaction with the application was far easier to achieve given hotkey control of Epic Pen and practitioner mistakes rarely caused trouble and sufficiently simulated backend features.

Below is a list of the tasks performed (in order of testing), each prompted by typographical and interactive elements within the interface (not by verbal direction).  Pertinent information regarding the language being tested was given by the practitioner prior to testing in order to support user interaction.

1. Logograph tracing

	- Users were instructed to trace a word on a central tile.

1. Tracing alphabetic characters

	- Users were instructed to trace a word given to them on a line, changing of the interface via hotkeys simulated writing interaction on the central tile and revealed to them that letters were registered one at a time.

1. Logograph freehanding

	- Users were instructed to write the same word they had traced during the first logograph exercise (revealed by the fact that the definition was the same).  One hint could be used to reveal half of the logograph's strokes.

1. Freehanding alphabetic characters

	- Users were instructed to write the word that appeared in the alphabetic tracing exercise (revealed by the fact that each had the same definition).  One hint could be used to show the word on the line above the central tile.

1. Logographic compoenent recognition

	- Users exercised trial and error in order to find which logographic compoenent matched the proposed definition (answer feedback was automated and required no use of hotkeys)

1. Matching logographic components with their respective characters

	- Users again exercised trial and error to find matches between logographic components and their characters, Users were told before this task that tiles with characters contained letters, whereas components did not.  Answer feedback was also automated in this task.

### Results

Though it was a major concern during lo-fi testing, Epic Pen did not heavily impede on testing the prototype during this iteration; features and design choices beyond those of Epic Pen were framed in their natural contexts and allowed users to reveal issues with the software being evaluated.  Whether overcoming this difficulty was solely a result of hotkey use or user expertise in the testing paradigm (as the same participants were used in lo-fi testing) is unknown, though both likely contributed.

While all participants were able to eventually realize that words were shared among the writing and tracing sections, testing languages intermittently (logographs interrupting alphabetic exercises) contributed to initial confusion as to what each user should write on the central tile.  Suspending or failing to include information (such as the language they are learning or what the word sounds like, as one user simply wrote the listed pronunciation during the logograhic writing task) detracted from the potential for the system to provide a reasonable or achievable challenge; the language's necessary features or fundamentals were presented in a disjointed way.

Though this structural issue contributed to user confusion, the feedback they received when they were incorrect was highly informative and clear, allowing each user to then produce what the system expected on their next trial.  Learning that there were no consequences to getting something wrong (that is, the exercise would start over), one user indicated that they would simply draw a picture of a sun and move on to see the answer.

Incorrectness appeared to be telegraphed by the graphical elements much better than correctness, as one user did not realize they had gotten the answer correct; the green logograph in the central tile was obfuscated by writing, and the "correct panel" and "you are correct" text that appeared near the central button was not obvious (in its motion or presentation) or did not contrast heavily enough with the central button.

Writing and tracing in both alphabetic tasks were more natural than logographic tasks (likely due to user familiarity) and users understood the "one letter at a time" paradigm, though more feedback could have been given in the freehanding sections as to what letter is currently being accepted as input.  Despite the inclusion of a hint button in both freehanding exercises, it was seldom used (though one user attempted to use it more than once in a single exercise out of frustration that he could not remeber the "word from before").  Whether this lack of usage was a consequence of the hint button's visual properties or the attitudes of users was not clear during the test, though additional hints could be added to future versions, conveying that they are not a "last resort", but a simple hint to propel their learning.

Apart from the writing tasks, both the recognition and matching tasks performed very well and supported natural user interaction through their comprehensive interactability and automated answer checking.  Trial and error was effectively used by each user to successfully complete each of the tasks, though changes could have been made to the opacity of correct matches, as it seemed to be a pain point for one user, prompting their interaction with an already matched tile.

Two users, following both of these last tasks, even reported that they had learned something from the recognition exercise, and could use this knowledge to help them in the matching exercise.  One user also reported that a logographic component "was a part of the word from before" indicating that they now understood the concept of components and logographs just by using the software. This was very exciting and could be used to determine the temporal ordering of these lessons in order to properly support application of user knowledge.

### Discussion and Future Directions

As indicated by the <b>Results</b> section above, minor visual changes should first be made to the prototype in order to correct the pain points surrounding the hint button and "correct" feedback.  More than one hint (through multiple buttons, or a meter) should be provided on each recall/freehanding task and should convey to the users that these hints are specific to this task and will not penalize them.  Apart from these visual changes, sound and equivalent informational pop-ups that provide the user context on what is being tested should be included in future iterations, reflecting the structure of analogous elements modeled in the lo-fi prototype and in current Duolingo software.

The greatest finding from this usability test was certainly the issues that arose from temporal placement of exercises and the mixing of language domains.  Future iterations should separate tasks according to language, a methodology already present within Duolingo.  Additionally, because of how easy they seemed to accomplish, logographic component recognition and matching should be placed before logograph tracing and writing as they provide foundational information relevant to constructing logographs.  Each logograph should also be given a hint as to the logograph's meaning or pronunciation in its radical form such that users can acquire knowledge and base their interactions on something other than trial and error.