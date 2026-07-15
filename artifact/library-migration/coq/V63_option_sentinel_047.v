(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_047.
Definition enc_47 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_47 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_47 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_47 : forall o : option nat, dec_47 (enc_47 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_47 : forall o : option nat, enc_47 o = size_47 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_47 : forall o : option nat, enc_47 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_047.

