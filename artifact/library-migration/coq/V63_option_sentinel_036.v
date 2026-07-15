(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_036.
Definition enc_36 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_36 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_36 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_36 : forall o : option nat, dec_36 (enc_36 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_36 : forall o : option nat, enc_36 o = size_36 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_36 : forall o : option nat, enc_36 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_036.

