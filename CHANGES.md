# v0.1.4

- The torso below the collar is 30% shorter. Width is 6% greater; the face and hat keep their vertical proportions, and feet remain anchored.
- Every miscast produces rising grey smoke, snapping red sparks, a red X, and a floating FIZZLE! label above the player. Feedback pauses with gameplay and expires after 1.05 seconds.
- Misfired projectiles are slow, short-lived sputtering sparks with smoke trails, rather than glowing fireballs. Sideways/backwards/feet-puff outcomes remain; probabilities and damage are unchanged.
- Miscast impacts use grey feedback, including the feet-puff variant. HUD failure feedback is red and explicitly says the spell fizzled.
- Windows/Linux/Web builds and source are distributed on a dedicated branch of forhide/Stone-Quotation, using GitHub raw download links.

Source validation: 28 smoke checks and 30 regression checks passed. Added regression checks cover the visible miscast burst, pause behavior, cleanup, and the failed projectile expiring.
