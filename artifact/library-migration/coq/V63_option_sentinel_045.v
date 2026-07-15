(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_045.
Definition enc_45 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_45 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_45 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_45 : forall o : option nat, dec_45 (enc_45 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_45 : forall o : option nat, enc_45 o = size_45 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_45 : forall o : option nat, enc_45 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_045.

