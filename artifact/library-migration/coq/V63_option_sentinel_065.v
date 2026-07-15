(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_065.
Definition enc_65 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_65 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_65 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_65 : forall o : option nat, dec_65 (enc_65 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_65 : forall o : option nat, enc_65 o = size_65 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_65 : forall o : option nat, enc_65 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_065.

