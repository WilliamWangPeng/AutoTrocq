(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_061.
Definition enc_61 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_61 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_61 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_61 : forall o : option nat, dec_61 (enc_61 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_61 : forall o : option nat, enc_61 o = size_61 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_61 : forall o : option nat, enc_61 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_061.

