(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_054.
Definition enc_54 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_54 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_54 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_54 : forall o : option nat, dec_54 (enc_54 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_54 : forall o : option nat, enc_54 o = size_54 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_54 : forall o : option nat, enc_54 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_054.

